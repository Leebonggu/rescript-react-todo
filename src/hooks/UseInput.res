  let useInput = (
    ~initialValue: 't
  ) => {
    let (state, setState) = React.useState(_ => initialValue)

    let handler = (event) => {
      let value = ReactEvent.Form.target(event)["value"]
      setState(value)
    }

    (state, handler, setState)
  }