import { getStore } from 'cfx.redux'

import constants from './constants'
import actions from './actions'
import reducers from './reducers'
import {
  todos
  initialState
} from './reducers'
import sagas from './sagas'

store = getStore {
  appName: 'todosRedux'
  reducers
  sagas
}

export {
  constants
  actions
  reducers
  todos
  initialState
  sagas
  getStore
  store
}