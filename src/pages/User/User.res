@module external style: {..} = "./User.module.css"

type item = {
  id: int,
  content: string,
  completed: bool, 
}

@react.component
let make = (
  ~id
) => {
  let ref = React.useRef(1)
  let (list, setList) = React.useState(_ => [])
  let (todo, handleTodo, setTodo) = UseInput.useInput(~initialValue = "")


  let addList = (_t: ReactEvent.Mouse.t) => {
    let len = todo ->  Js.String.length
    if (len > 0) {
      let added  = {
        id: ref.current + 1,
        content: todo,
        completed: false,
      }
      let newLsit = list ->Belt.Array.concat([added])
      setList(_ => newLsit)
      setTodo(_ => "")
      ref.current =+ 1
    }
  }

  let todoToggle = (id: int) => { Js.log("Toggle") }

  let deleteList = (id: int) => { Js.log("Delete") }

  let todos = Belt.Array.map(list, (li) => {
    <div
      key={li.id -> Js.String2.make}
      onClick={_ => Js.log("div")}
    >
      {React.string(li.content)}
    </div>
  })

  <div>
    <div>{`${id}님 안녕하세요` -> React.string}</div>
    <Input
      value=todo
      onChange=handleTodo
      onSubmit=addList
      name=`제출`
    />
    {todos -> React.array}
  </div>
}