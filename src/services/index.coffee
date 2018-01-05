import config from './config'
import getTodosService from './todos'

lc =
  create: (getTodosService config.lc.todos).create
  fetch: (getTodosService config.lc.todos).fetch
  patch: (getTodosService config.lc.todos).patch
  reload: (getTodosService config.lc.todos).reload
  remove: (getTodosService config.lc.todos).remove


local =
  create: (getTodosService config.local.todos).create
  fetch: (getTodosService config.local.todos).fetch
  patch: (getTodosService config.local.todos).patch
  reload: (getTodosService config.local.todos).reload
  remove: (getTodosService config.local.todos).remove

export {
  lc
  local
}