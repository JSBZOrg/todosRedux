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
    data = yield services.lc.create toolFunc
    ,
      payload.data
    if data?
      yield put 
        type: type.save
        payload: {
          todo: data
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
    data = yield services.lc.fetch toolFunc
    ,
      payload.data
    if data?
      yield put 
        type: type.save
        payload: {
          todo: data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'fetch error'
    return
  
  patch: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.patch toolFunc
    ,
      payload.data
    if data?
      yield put 
        type: type.save
        payload: {
          todo: data
        }
      yield payload.callback.success data
    else
      yield payload.callback.fail 'patch error'
    return
  
  reload: (
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

  remove: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.remove toolFunc
    ,
      payload
    yield put 
      type: type.save
      payload: {
        todo: data
      }
    return 

  