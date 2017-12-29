import dd from 'ddeyes'
import 'shelljs/make'
import todosRedux from '../todosTest/redux'

target.all = ->
  dd 'Hello todosApp ！'

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