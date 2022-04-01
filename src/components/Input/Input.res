@module external  styles: {..} = "./Input.module.css"

@react.component
let make = (
  ~value,
  ~onChange,
  ~onSubmit,
  ~name: string
) => {
  <div className=styles["container"]>
    <label>
      <span className=styles["labelSpan"]>{"Input" -> React.string}</span>
      <input
        className=styles["input"]
        value={value}
        onChange={onChange}
      />
    </label>
    <button onClick=onSubmit>{name -> React.string}</button>
  </div>
}