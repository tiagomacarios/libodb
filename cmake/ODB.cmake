function(ODB)
    set(options)
    set(oneValueArgs FILE FLAGS)
    set(multiValueArgs TARGET)
    cmake_parse_arguments(ODB
        "${options}"
        "${oneValueArgs}"
        "${multiValueArgs}"
        ${ARGN}
    )

    if(NOT ODB_PROGRAM)
        find_program(ODB_PROGRAM odb
            PATHS C:/_Working/ODB2.5_binaries/windows/bin /mnt/c/Users/tmc/Downloads/odb-2.5.0-a9/linux/bin)
        if(ODB_PROGRAM)
            message(STATUS "Found ${ODB_PROGRAM}")
        else()
            message(FATAL_ERROR "Unable to find odb")
        endif()
    endif()

    separate_arguments(ODB_FLAGS)
    list(INSERT ODB_FLAGS 0 -I/mnt/c/Users/tmc/Downloads/libodb-2.5.0-a9/)
    set(ODB_FLAGS ${ODB_FLAGS} --output-dir ${CMAKE_CURRENT_BINARY_DIR})

    get_filename_component(ODB_FILE_RAW ${ODB_FILE} NAME_WE)

    set(ODB_LOCAL_OUTPUT ${ODB_FILE_RAW}-odb.cxx)

    #set(ODB_OUPUT ${ODB_OUPUT} ${ODB_LOCAL_OUTPUT} PARENT_SCOPE)

    add_custom_command(
        OUTPUT ${ODB_LOCAL_OUTPUT}
        COMMAND ${ODB_PROGRAM} ${ODB_FLAGS} ${CMAKE_CURRENT_SOURCE_DIR}/${ODB_FILE}
        DEPENDS ${ODB_FILE}
    )

    get_filename_component(executable ${CMAKE_CURRENT_SOURCE_DIR} NAME)
    set(target_name odb-${executable}-${ODB_FILE_RAW})
    add_custom_target(${target_name} ALL
        DEPENDS ${ODB_LOCAL_OUTPUT}
    )

    set_property(TARGET ${target_name} PROPERTY FOLDER ODB_compiler)

    set_source_files_properties(
        ${ODB_LOCAL_OUTPUT}
        PROPERTIES GENERATED TRUE
    )

    if (ODB_TARGET)
        set(${ODB_TARGET} ${target_name} PARENT_SCOPE)
    endif()

endfunction()
