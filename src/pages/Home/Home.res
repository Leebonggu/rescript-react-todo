type timerId
@val external setTimeout: (unit => unit, int) => timerId = "setTimeout"
@val external clearTimeout: timerId => unit = "clearTimeout"

@react.component
let make = () => {
  <div>
    <Counter />
  </div>
}