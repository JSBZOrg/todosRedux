import dd from 'ddeyes'
import 'shelljs/make'
import todosRedux from '../../src/todosTest/redux'

target.all = ->
  dd 'Hello todosRedux ！'

target.static = ->
  todosRedux.staticFuc()

target.reducers = ->
  todosRedux.reducersFuc()



target.sagas = ->
  data = await todosRedux.createFuc()

  await todosRedux.fetchFuc data

  data_patch = await todosRedux.patchFuc data

  data_reload = await todosRedux.reloadFuc()

  await todosRedux.removeFuc data.objectId