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
    state.reduce (result, current, _index, array) => 
      temp = []      
      if current.id is id
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
        temp
    , null
          
  patch:(
    state
    {
      payload: {
        id: id
        todo: todo
      }
    }
  ) =>
    state.reduce (result, current, _index, array) => 
      temp = []       
      if current.id is id
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
        temp
    , null

    [
      todo
      temp...
    ]
    
  remove:(
    state
    {
      payload: {
        todo: []
      }
    }
  ) =>
    []
