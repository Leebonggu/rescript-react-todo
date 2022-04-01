type timerId
@val external setTimeout: (unit => unit, int) => timerId = "setTimeout"
@val external clearTimeout: timerId => unit = "clearTimeout"
@module external styles: {..} = "./Counter.module.css"

@react.component
let make = () => {
  let (counter, setCounter) = React.useState(_ => 0)

  React.useEffect1(() => {
    let id = setTimeout(() => { 
      setCounter(prev => prev + 1)
    }, 1000)
    let cleanup = () => clearTimeout(id)

    Some(cleanup)
  }, [counter])
  <div className=styles["container"]>
    <span className=styles["number"]>
      {counter -> Belt.Int.toString -> React.string}
    </span>
  </div>
}