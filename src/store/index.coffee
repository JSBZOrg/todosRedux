import { getStore } from 'cfx.redux'
import constants from './constants'
import actions from './actions'
import reducers from './reducers'
import sagas from './sagas'
import {
  todos
  initialState
} from './reducers'

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
