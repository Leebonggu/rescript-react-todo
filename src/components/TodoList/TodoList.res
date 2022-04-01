@module external style: {..} = "./TodoList.module.css"

@react.component
let make = (
  ~list,
) => {
  let todos = 
    Belt.Array.map(list, (li) => {
  <li> {React.string(li)} </li>
})
  <div>{todos -> React.array}</div>
}