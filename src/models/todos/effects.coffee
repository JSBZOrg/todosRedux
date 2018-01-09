import dd from 'ddeyes'
import config from '../../services/config'
import * as services from '../../services'
import toolFunc from '../../utils/helper'

export default ({
  type
}) ->
  create: (
    {
      payload
    }
    { put }
  ) ->
    todo = {
      payload.data...
      isCompleted: false
    }
    data = yield services.lc.create toolFunc
    ,
      todo
    results = yield services.lc.reload toolFunc
    todo = results.results
    if data?
      yield put 
        type: type.save
        payload: {
          todo: todo
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'create error'
    return

  fetch: (
    {
      payload
    }
    { put }
  ) ->
    temp = []
    data = yield services.lc.reload toolFunc
    data.results.reduce (r, c, index, array) =>
      if c.isCompleted is payload.data.isCompleted
        temp.push array[index]
      temp
    , []
    if data?
      yield put 
        type: type.save
        payload: {
          todo: temp
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'fetch error'
    return
  
  update: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.patch toolFunc
    ,
      payload.data
    results = yield services.lc.reload toolFunc 
    todo = results.results 
    if data?
      yield put 
        type: type.save
        payload: {
          todo: todo
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'patch error'
    return
  
  fetchAll: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.reload toolFunc
    if data?
      yield put 
        type: type.save
        payload: {
          todo: data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'reload error'
    return

  delete: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.remove toolFunc
    ,
      payload
    results = yield services.lc.reload toolFunc 
    todo = results.results 
    yield put 
      type: type.save
      payload: {
        todo: todo
      }
    return 

  