export default config = do ->
  header =
    todos: do ->
      base =
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      {
        base
        master: {
          base...
          'X-LC-Key': 'eQYsxL68rSQLFyxiPtgxN4wW,master'
        }
      }

  baseUri =
    lc_uri: "https://xY1g1Vfw.api.lncld.net/1.1/classes"
    local_uri: "http://192.168.0.192:7001"
  
  className = 
    name: 'Todos'

  Todos =
    create:
      uri:
        lc: ->
          "#{baseUri.lc_uri}/#{className.name}?fetchWhenSave=true"
        local: ->
          "#{baseUri.local_uri}/todos"
      method: 'POST'

    fetch:
      uri:
        lc: (data) ->
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) ->
          "#{baseUri.local_uri}/todos/#{data.objectId}"
      method: 'GET'
    
    patch:
      uri:
        lc: (data) ->
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}?fetchWhenSave=true"
        local: (data) ->
          "#{baseUri.local_uri}/todos/#{data.objectId}"
      method: 'PUT'
    
    reload:
      uri:
        lc: ->
          "#{baseUri.lc_uri}/#{className.name}"
        local: ->
          "#{baseUri.local_uri}/todos"
      method: 'GET'
    
    remove:
      uri:
        lc: (data) ->
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) ->
          "#{baseUri.local_uri}/todos/#{data.objectId}"
      method: 'DELETE'

  # localhost
  local:
    todos:
      create:
        className: className.name
        headers: header.todos.base
        uri: Todos.create.uri.local
        method: Todos.create.method
    
      fetch:
        className: className.name
        headers: header.todos.base
        uri: Todos.fetch.uri.local
        method: Todos.fetch.method
      
      patch:
        className: className.name
        headers: header.todos.base
        uri: Todos.patch.uri.local
        method: Todos.patch.method
      
      reload:
        className: className.name
        headers: header.todos.base
        uri: Todos.reload.uri.local
        method: Todos.reload.method
      
      remove:
        className: className.name
        headers: header.todos.base
        uri: Todos.remove.uri.local
        method: Todos.remove.method

  # leanCloud
  lc:
    todos:
      create:
        className: className.name
        uri: Todos.create.uri.lc
        headers: header.todos.base
        method: Todos.create.method
        
      fetch:
        className: className.name
        uri: Todos.fetch.uri.lc
        headers: header.todos.base
        method: Todos.fetch.method
      
      patch:
        className: className.name
        uri: Todos.patch.uri.lc
        headers: header.todos.base
        method: Todos.patch.method
      
      reload:
        className: className.name
        uri: Todos.reload.uri.lc
        headers: header.todos.base
        method: Todos.reload.method
      
      remove:
        className: className.name
        uri: Todos.remove.uri.lc
        headers: header.todos.base
        method: Todos.remove.method




