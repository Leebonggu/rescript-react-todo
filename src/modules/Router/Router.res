@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{"user", id} => <User id />
  | list{} => <Home/>
  | _ => <PageNotFound/>
  }
}