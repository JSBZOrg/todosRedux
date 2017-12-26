import axios from 'axios'
import dd from 'ddeyes'

export default toolFuc = (
  uri
  {
    method
    headers
    data= ''
  }
  
) ->
  axios
    method: method
    headers: headers
    url: uri
    data: data

  .then (response) ->
    response.data if (
      response.status >= 200 and
      response.status < 300
    ) 

  .catch (error) ->
    dd error