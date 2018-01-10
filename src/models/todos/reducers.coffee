import dd from 'ddeyes'
import uuidFunc from '../../utils/randomId'

export default
  ## REDUCE  save  patch  reload  remove  removeAll
  ## SAGAS  save
  save: (
    state
    {
      payload: {
        todo: todo
      }
    }
  ) => 
    if typeof todo is 'object' and todo.objectId isnt 'undefined'
      todo
    else
      [
        state...
        objectId: uuidFunc()
        todo: todo
        isCompleted: false
      ]
  
  patch: (
    state
    {
      payload: {
        objectId: objectId
        todo: todo
        isCompleted: isCompleted
      }
    }
  ) =>
    temp = []       
    state.reduce (result, current, _index, array) =>
      if current.objectId is objectId
        temp = JSON.parse JSON.stringify array
        temp[_index].todo = todo
        temp[_index].isCompleted = isCompleted
    , []
    temp
  
  reload: (
    state
    {
      payload: {
        todo: todo
      }
    }
  ) =>
    state

  remove: (
    state
    {
      payload: {
        objectId: objectId
      }
    }
  ) =>
    temp = []          
    state.reduce (result, current, _index, array) =>                 
      if current.objectId is objectId
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
      temp
    , []
  
  removeAll: (
    state
    {
      payload: {
        todo: []
      }
    }
  ) =>
    []