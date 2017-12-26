import dd from 'ddeyes'

export default
  save: (
    state
    {
      payload: {
        data: todos
      }
    }
  ) =>
    todos
  
  create:(
    state
    {
      payload: {
        data: todos
      }
    }
  ) =>
    todos
  
  fetch:(
    state
    {
      payload: {
        uuid: uuid
      }
    }
  ) =>
    if uuid is state[0].uuid
      state
    else
      return '查找失败！'

  patch:(
    state
    {
      payload: {
        data: todos
      }
    }
  ) =>
    if todos[0].uuid is state[0].uuid
      todos
    else
      return '更新失败！'
  
  remove:(
    state
    {
      payload: {
        data: todos
      }
    }
  ) =>
    todos
