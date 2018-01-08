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

  # create:(
  #   state
  #   {
  #     payload: {
  #       todo: todo
  #     }
  #   }
  # ) =>
  #   [
  #     state...
  #     todo
  #   ]

  removeOne:(
    state
    {
      payload: {
        id: id
      }
    }
  ) =>
    temp = []          
    state.reduce (result, current, _index, array) =>                 
      if current.id is id
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
      temp
    , state

          
  patchOne:(
    state
    {
      payload: {
        id: id
        todo: todo
        isCompleted: isCompleted
      }
    }
  ) =>
    temp = []       
    state.reduce (result, current, _index, array) =>
      if current.id is id
        temp = JSON.parse JSON.stringify array
        temp[_index].todo = todo
        temp[_index].isCompleted = isCompleted
    , null

    temp
    
  remove:(
    state
    {
      payload: {
        todo: []
      }
    }
  ) =>
    []
