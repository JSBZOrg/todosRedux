import dd from 'ddeyes'
import isEqual from 'is-equal'
import uuidFunc from '../utils/randomId'
import * as store from '../store'

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

  uuid_01 = uuidFunc()
  uuid_02 = uuidFunc()
  uuid_03 = uuidFunc()
  
  myStore.dispatch actions.todosCreateOne
    todo:
      id: uuid_01
      company: '武汉举手帮租有限公司'
      main: '旅游、租房'
      location: '武汉'

  myStore.dispatch actions.todosCreateOne
    todo:
      id: uuid_02
      company: '杭州阿里巴巴有限公司'
      main: '电商'
      location: '杭州'

  myStore.dispatch actions.todosCreateOne
    todo:
      id: uuid_03
      company: '深圳大疆科技有限公司'
      main: '无人机'
      location: '深圳'
  
  myStore.dispatch actions.todosRemoveOne
    id: uuid_02

  myStore.dispatch actions.todosPatch
    todo:
      id: uuid_01
      company: '举手帮租集团'
      main: '金融各个领域'
      location: '全球'

  myStore.dispatch actions.todosSave
    todo: myStore.getState().todosApp.todos

  myStore.dispatch actions.todosFetchOne
    id: uuid_01

  myStore.dispatch actions.todosRemove
    todo: []

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

export default classRedux = {
  createFuc
  fetchFuc
  patchFuc
  reloadFuc
  removeFuc
  getIds
  reducersFuc
  staticFuc
}