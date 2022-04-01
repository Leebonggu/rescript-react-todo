@module external styles: {..} = "./Header.module.css"
@bs.val("Math.random") external random : unit => float = "random"
@bs.val("Math.round") external round : int => int = "round"

type menu = {
  idx: string,
  name: string,
  path: string,
}

@react.component
let make = () => {

  let numToString = (item: 'number) => item -> Js.String2.make

  let userId = numToString(random() -> Belt.Float.toInt -> round)

  let move = (path) => RescriptReactRouter.push(path)

  let str = (str) => str -> React.string

  let menus = [
    {
      idx: `1`,
      name: `home`,
      path: `/`,
    },
    {
      idx: `2`,
      name: `user`,
      path: `/user/${userId}`
    }
  ]
  
  let items = menus
    -> Belt.Array.map(x => <div className=styles["item"] key={x.idx} onClick={_ => move(x.path)}>{str(x.name)}</div>)

  <div className=styles["container"]>
    {items -> React.array}
  </div>
}