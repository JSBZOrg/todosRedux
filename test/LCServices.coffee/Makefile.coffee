import 'shelljs/make'
import dd from 'ddeyes'
import {
  create
  fetch
  patch
  reload
  remove
  removeAll
} from './tasks'

target.all = =>
  target.addOne()
  target.fetchOne()
  target.reload()
  target.patch()
  target.remove()

target.addOne = =>
  create('哈哈哈', '哈哈哈', '哈哈哈')
    .then (result) =>
      dd result
    
target.addMore = =>
  create('哈哈哈', '哈哈哈', '哈哈哈')
    .then (result) =>
      dd result
  create('啦啦啦', '啦啦啦', '啦啦啦')
    .then (result) =>
      dd result

target.fetchOne = =>
  reload()
    .then (result) =>
      fetch(result.results[result.results.length-1].objectId)
        .then (result) =>
          dd result
    
target.reload = =>
  reload()
    .then (result) =>
      dd result

target.patch = =>
  reload()
    .then (result) =>
      patch(
        result.results[result.results.length-1].objectId
        '武汉和风和乐有限公司'
        '旅游'
        '武汉'
      )
        .then (result) =>
          dd result

target.remove = =>
  reload()
    .then (result) =>
      remove(result.results[result.results.length-1].objectId)
        .then (result) =>
          dd result

    