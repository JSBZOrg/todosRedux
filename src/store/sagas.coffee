import dd from 'ddeyes'
import { sagaEffects } from 'cfx.redux-saga'
import constants from './constants'
import config from '../services/config'
import getTodosSagas from '../models/todos/effects'

todosSagas = getTodosSagas
  type:
    save: 'TODO_SAVE'
    create: 'TODO_CREATE'
    update: 'TODO_UPDATE'
    delete: 'TODO_DELETE'
    deleteAll: 'TODO_DELETE_ALL'
    fetch: 'TODO_FETCH'
    fetchAll: 'TODO_FETCH_ALL'
  
{
  put
  takeLatest
} = sagaEffects

{
  TODO_SAVE
  TODO_CREATE
  TODO_UPDATE
  TODO_DELETE
  TODO_DELETE_ALL
  TODO_FETCH
  TODO_FETCH_ALL
} = constants.types

todos =

  create: (action) ->
    todosSagas.create action
    , {
      put
    }

  update: (action) ->
    todosSagas.update action
    , {
      put
    }
  
  delete: (action) ->
    todosSagas.delete action
    , {
      put
    }

  deleteAll: (action) ->
    todosSagas.deleteAll action
    , {
      put
    }

  fetch: (action) ->
    todosSagas.fetch action
    , {
      put
    }

  fetchAll: (action) ->
    todosSagas.fetchAll action
    , {
      put
    }

export default [
  ->
    yield takeLatest TODO_CREATE
    , todos.create
  ->
    yield takeLatest TODO_UPDATE
    , todos.update
  ->
    yield takeLatest TODO_DELETE
    , todos.delete
  ->
    yield takeLatest TODO_DELETE_ALL
    , todos.deleteAll
  ->
    yield takeLatest TODO_FETCH
    , todos.fetch
  ->
    yield takeLatest TODO_FETCH_ALL
    , todos.fetchAll
]
