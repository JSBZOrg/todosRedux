import dd from 'ddeyes'

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
      todo
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
        todo: todo
      }
    }
  ) =>
    for i of state
      if state[i].id is todo.id
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
    
  
  remove:(
    state
    {
      payload: {
        todo: todo
      }
    }
  ) =>
    todo