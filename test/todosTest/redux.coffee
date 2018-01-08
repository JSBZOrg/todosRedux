import dd from 'ddeyes'
import isEqual from 'is-equal'
import uuidFunc from '../../src/utils/randomId'
import * as store from '../../src/store'

{
  constants
  actions
  reducers
  sagas
  getStore
} = store

subscriber = (
  prevState
  nextState
  action
  dispatch
) ->
  unless action.type isnt 'TODOS_SAVE'
    return dd @getState() if not isEqual prevState, nextState
  unless action.type isnt 'TODOS_FETCH'
    return dd @getState()
  
myStore = getStore {
  appName: 'todosApp'
  reducers
  sagas
  subscriber:
    async: subscriber
}

# static 
staticFuc = ->
  dd {
    constants
    actions
  }

# reducers 
reducersFuc = ->

  myStore = getStore {
    appName: 'todosApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }
  id01 = uuidFunc()
  id02 = uuidFunc()
  id03 = uuidFunc()
  
  myStore.dispatch actions.todosCreate
    todo:
      id: id01
      todo: 'oo'
      isCompleted: true

  myStore.dispatch actions.todosCreate
    todo:
      id: id02
      todo: 'oooopp'
      isCompleted: false      

  # myStore.dispatch actions.todosCreate
  #   todo: 
  #     id: id03
  #     name: 'ooll'

  # myStore.dispatch actions.todosRemoveOne
  #   id: id02

  myStore.dispatch actions.todosPatchOne
    id: id01
    todo: 'hello'
    isCompleted: 'true'
      
  # myStore.dispatch actions.todosSave
  #   todo: todo

  # myStore.dispatch actions.todosRemove
  #   todo: []

  myStore.onsubscribe()
  
# create class  
createFuc = ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.todosCreate 
      data:
        company: '湖北和风和乐有限公司'
        main: '旅游、租房'
        location: '武汉'
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

# fetch class
fetchFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.todosFetch
      data:
        objectId: data.objectId
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

# patch class
patchFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.todosPatch
      data:
        objectId: data.objectId
        company: '阿里巴巴有限公司'
        main: '租房大佬'
        location: '武汉'
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

# reload class
reloadFuc = ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.todosReload
      data: ''
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

# remove class
removeFuc = (data) ->
  myStore.dispatch actions.todosRemove
    objectId: data

# get ids
getIds = (data) ->
  data.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []

export default {
  createFuc
  fetchFuc
  patchFuc
  reloadFuc
  removeFuc
  getIds
  reducersFuc
  staticFuc
}