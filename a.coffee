arr = [
  {
    id: 1
    name: '陈欢'
  }
  {
    id: 2
    name: '刘章仁'
  }
  {
    id: 3
    name: '何文涛'
  }
]



test = (id) =>
  arr.reduce (result, current, _index, array) =>  
    if current.id is id
      array.splice _index, 1
      array
    else result
  , null

test 2

