import dd from 'ddeyes'
import config from '../../services/config'
import services from '../../services'
import toolFuc from '../../utils/helper'

export default ({
  type
}) ->
  create: (
    {
      payload
    }
    { put }
  ) ->
    data = yield services.lc.create toolFuc
    ,
      payload.data
    if data?
      yield put 
        type: type.save
        payload: {
          data
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
    data = yield services.lc.fetch toolFuc
    ,
      payload.data
    if data?
      yield put 
        type: type.save
        payload: {
          data
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
    data = yield services.lc.patch toolFuc
    ,
      payload.data
    if data?
      yield put 
        type: type.save
        payload: {
          data
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
    data = yield services.lc.reload toolFuc
    if data?
      yield put 
        type: type.save
        payload: {
          data
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
    data = yield services.lc.remove toolFuc
    ,
      payload
    yield put 
      type: type.save
      payload: {
        data
      }
    return 

  