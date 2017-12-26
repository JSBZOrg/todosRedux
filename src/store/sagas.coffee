import { sagaEffects } from 'cfx.redux-saga'
import dd from 'ddeyes'
import constants from './constants'
import config from '../services/config'
import getTodosSagas from '../models/todos/effects'

todosSagas = getTodosSagas
  type:
    save: 'TODOS_SAVE'
    fetch: 'TODOS_FETCH'
    remove: 'TODOS_REMOVE'
    patch: 'TODOS_PATCH'
    create: 'TODOS_CREATE'
    reload: 'TODOS_RELOAD'
  
{
  put
  takeLatest
} = sagaEffects

{
  TODOS_FETCH
  TODOS_REMOVE
  TODOS_PATCH
  TODOS_CREATE
  TODOS_RELOAD
} = constants.types

todos =

  fetch: (action) ->
    action.payload = {} unless action.payload?
    todosSagas.fetch action
    , {
      put
    }

  remove: (action) ->
    todosSagas.remove action
    , {
      put
    }

  patch: (action) ->
    todosSagas.patch action
    , {
      put
    }

  create: (action) ->
    todosSagas.create action
    , {
      put
    }

  reload: (action) ->
    todosSagas.reload action
    , {
      put
    }

export default [
  ->
    yield takeLatest TODOS_FETCH
    , todos.fetch
  ->
    yield takeLatest TODOS_REMOVE
    , todos.remove
  ->
    yield takeLatest TODOS_PATCH
    , todos.patch
  ->
    yield takeLatest TODOS_CREATE
    , todos.create
  ->
    yield takeLatest TODOS_RELOAD
    , todos.reload
]
