import dd from 'ddeyes'
import toolFunc from '../../src/utils/helper'
import * as services from '../../src/services'

create = (company, main, location) =>
  data = await services.lc.create toolFunc
  ,
    company: company
    main: main
    location: location
  data

fetch = (objectId) =>
  data = await services.lc.fetch toolFunc
  ,
    objectId: objectId
  data

patch = (objectId, company, main, location) =>
  data = await services.lc.patch toolFunc
  ,
    objectId: objectId
    company: company
    main: main
    location: location
  data

reload = =>
  data = await services.lc.reload toolFunc
  data

remove = (objectId) =>
  data = services.lc.remove toolFunc
  ,
    objectId: objectId
  data

removeAll = (data) =>
  ids = data.reduce (r, c) =>
    [
      r...
      c.objectId
    ]
  , []
  for id in ids
    data = services.lc.remove toolFunc
    ,
      objectId: id
    data

export {
  create
  fetch
  patch
  reload
  remove
  removeAll
}