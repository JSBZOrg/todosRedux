import dd from 'ddeyes'

export default (
  config
) ->
  # create todo
  create: (
    request
    data
  ) ->
    request config.create.uri()
    ,
      method: config.create.method
      headers: config.create.headers
      data: data

  # fetch todo
  fetch: (
    request
    data
  ) ->
    request (config.fetch.uri data)
    ,
      method: config.fetch.method
      headers: config.fetch.headers
      data: data

  # patch todo
  patch: (
    request
    data
  ) ->
    request (config.patch.uri data)
    , 
      method: config.patch.method
      headers: config.patch.headers
      data: data

  # reload todos
  reload: (
    request
  ) ->
    request config.reload.uri()
    ,
      method: config.reload.method
      headers: config.reload.headers
  
  # remove todo
  remove: (
    request
    data
  ) ->
    request (config.remove.uri data)
    ,
      method: config.remove.method
      headers: config.remove.headers
      data: data