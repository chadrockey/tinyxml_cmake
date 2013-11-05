cmake_minimum_required(VERSION 2.8)
project(tinyxml)

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

if(MSVC OR MSVC90 OR MSVC10)
  set(MSVC ON)
endif (MSVC OR MSVC90 OR MSVC10)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
)

add_library(tinyxml tinyxml.cpp tinystr.cpp tinyxmlerror.cpp tinyxmlparser.cpp)

install(TARGETS tinyxml
  DESTINATION lib/)

install(FILES tinyxml.h tinystr.h
  DESTINATION include)

set(PKG_NAME ${PROJECT_NAME})
set(PKG_LIBRARIES tinyxml)
set(cmake_conf_file "${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}-config.cmake")
configure_file("${cmake_conf_file}.in" "${cmake_conf_file}" @ONLY)
install(FILES ${cmake_conf_file} DESTINATION share/${PROJECT_NAME}/cmake/ COMPONENT cmake)

if (NOT MSVC)
  set(PKG_DESC "tinyxml")
  set(PKG_CB_LIBS "-ltinyxml")
  set(pkg_conf_file "${CMAKE_CURRENT_SOURCE_DIR}/tinyxml.pc")
  configure_file("${pkg_conf_file}.in" "${pkg_conf_file}" @ONLY)
  install(FILES ${pkg_conf_file} DESTINATION lib/pkgconfig/ COMPONENT pkgconfig)
endif()

