$(function() {

    var homeInput = function(val) {
      var inputVal;
      console.log(val, inputVal)
      return function(val) {
        if (arguments.length === 0) {
          console.log('if')
          return inputVal
        } else {
          console.log('else')
          inputVal = val
          return this
        }
        console.log(inputVal)
      } 
    }
  
    var storeHomeInput = homeInput()
  
    $('#home-search-input').on("keyup paste", function() {
      storeHomeInput($(this).val())
    })
  
    $('#home-sub-form').on("submit", function() {
        event.preventDefault()
        var finalHomeInputVal = storeHomeInput()
        console.log(finalHomeInputVal)
        // window.location.href = "/search_results?param=" + finalHomeInputVal
    })
  })