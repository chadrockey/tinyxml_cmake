if (tinyxml_CONFIG_INCLUDED)
  return()
endif()
set(tinyxml_CONFIG_INCLUDED TRUE)

set(tinyxml_INCLUDE_DIRS /usr/local/include)

foreach(lib tinyxml)
  set(onelib "${lib}-NOTFOUND")
  find_library(onelib ${lib}
    PATHS /usr/local/lib
    NO_DEFAULT_PATH
    )
  if(NOT onelib)
    message(FATAL_ERROR "Library '${lib}' in package tinyxml is not installed properly")
  endif()
  list(APPEND tinyxml_LIBRARIES ${onelib})
endforeach()

foreach(dep )
  if(NOT ${dep}_FOUND)
    find_package(${dep})
  endif()
  list(APPEND tinyxml_INCLUDE_DIRS ${${dep}_INCLUDE_DIRS})
  list(APPEND tinyxml_LIBRARIES ${${dep}_LIBRARIES})
endforeach()
