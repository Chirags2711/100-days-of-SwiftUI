import Cocoa

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)


isAuthenticated.toggle() //less code
print(isAuthenticated)
