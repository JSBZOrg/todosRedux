import dd from 'ddeyes'
import isEqual from 'is-equal'
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
) =>
  return dd myStore.getState() if not isEqual prevState, nextState
  
  
  
myStore = getStore {
  appName: 'todosApp'
  reducers
  sagas
  subscriber:
    async: subscriber
}

todoCreate = (todo) =>
  new Promise (resolve, reject) =>
    myStore.dispatch actions.todoCreate 
      data:
        todo: todo
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

todoFetch = (isCompleted) =>
  new Promise (resolve, reject) =>
    myStore.dispatch actions.todoFetch
      data: 
        isCompleted: isCompleted
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

todoUpdate = (data, todo, isCompleted) =>
  new Promise (resolve, reject) =>
    myStore.dispatch actions.todoUpdate
      data:
        objectId: data.objectId
        todo: todo
        isCompleted: isCompleted
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

todoFetchAll = =>
  new Promise (resolve, reject) =>
    myStore.dispatch actions.todoFetchAll
      data: ''
      callback:
        success: (data) =>
          resolve data
        fail: (data) =>
          reject data

todoDelete = (objectId) =>
  myStore.dispatch actions.todoDelete
    objectId: objectId

getIds = (data) =>
  data.reduce (r, c) =>
    [
      r...
      c.objectId
    ]
  , []

export {
  todoCreate
  todoFetch
  todoFetchAll
  todoUpdate
  todoDelete
  getIds
}