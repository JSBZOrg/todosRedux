import dd from 'ddeyes'
import 'shelljs/make'
import {
  staticFuc
  todoSave
  todoPatch
  todoReload
  todoRemove
  todoRemoveAll
} from './reduce'

import {
  todoCreate
  todoFetch
  todoFetchAll
  todoUpdate
  todoDelete
  getIds
} from './sagas'

target.all = =>
  dd 'Hello todosApp ！'

target.static = =>
  staticFuc()

target.reducers = =>
  # 先增两个再删一个  再增一个 再修改一个 再返回所有 再删除一个 最后删除全部
  todoSave()
  todoSave()
  todoRemove()
  todoSave()
  todoPatch()
  todoReload()
  todoRemove()
  todoRemoveAll()
  
target.sagas = =>
  # data = await todoCreate '陈奕迅'
  # data1 = await todoCreate 'haoya'
  # await todoFetch true
  # await todoUpdate data.objectId, '陈奕迅', true
  await todoFetchAll()
  # await todoFetch false
  # await todoDelete data1.objectId