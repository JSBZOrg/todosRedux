import dd from 'ddeyes'
import uuidFunc from '../../utils/randomId'

export default
  save: (
    state
    {
      payload: {
        todo: todo
      }
    }
  ) =>
    todo
  
  create:(
    state
    {
      payload: {
        todo: todo
      }
    }
  ) =>
    [
      state...
      id: uuidFunc()
      todo: todo
      isCompleted: false
    ]
  
  removeOne:(
    state
    {
      payload: {
        id
      }
    }
  ) =>
    for i of state
      if state[i].id is id
        index = state.indexOf state[i]
        if index isnt -1
          temp = JSON.parse JSON.stringify state
          temp.splice index, 1
    temp
          
  patch:(
    state
    {
      payload: {
        id: id
        todo: todo
      }
    }
  ) =>
    for i of state
      if state[i].id is id
        index = state.indexOf state[i]
        if index isnt -1
          temp = JSON.parse JSON.stringify state
          temp.splice index, 1
    [
      todo
      temp...
    ]
  
  fetchOne:(
    state
    {
      payload: {
        id
      }
    }
  ) =>
    for i of state
      if state[i].id is id
        index = state.indexOf state[i]
        if index isnt -1
          temp = JSON.parse JSON.stringify state
    temp.splice index, 1      
    
  fetch:(
    state
    {
      payload: {
        todo: []
      }
    }
  ) =>
    state.reduce (r, c) =>
      [
        r...
        c
      ]
    , []

  remove:(
    state
    {
      payload: {
        todo: []
      }
    }
  ) =>
    []
