import child_process from "child_process";

export const handler =  async function(event, context) {
  console.log("In handler")
  child_process.exec("./script.sh");
  return "OK"
}

console.log("Run in app.js")