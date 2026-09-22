// для генерации кода на Bash — magick-to-webp
open System.IO

let resultCode, resultOutput, resultError =
  startProgram "magick" [
    path
    Path.ChangeExtension(path, ".webp")
  ]
if resultCode <> 0 then
  failwithf "%A" resultError

File.Delete path
