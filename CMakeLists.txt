cmake_minimum_required(VERSION 3.5)
project(odb CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake" PARENT_SCOPE)

set(ODB_INCLUDE
    odb/cache-traits.hxx
    odb/callback.hxx
    odb/connection.hxx
    odb/connection.ixx
    odb/connection.txx
    odb/container-traits.hxx
    odb/core.hxx
    odb/database.hxx
    odb/database.ixx
    odb/database.txx
    odb/exception.hxx
    odb/exceptions.hxx
    odb/forward.hxx
    odb/function-table.hxx
    odb/lazy-pointer-traits.hxx
    odb/lazy-ptr.hxx
    odb/lazy-ptr.ixx
    odb/lazy-ptr.txx
    odb/lazy-ptr-impl.hxx
    odb/lazy-ptr-impl.ixx
    odb/lazy-ptr-impl.txx
    odb/nested-container.hxx
    odb/no-id-object-result.hxx
    odb/no-id-object-result.txx
    odb/no-op-cache-traits.hxx
    odb/nullable.hxx
    odb/object-result.hxx
    odb/pointer-traits.hxx
    odb/polymorphic-info.hxx
    odb/polymorphic-map.hxx
    odb/polymorphic-map.ixx
    odb/polymorphic-map.txx
    odb/polymorphic-object-result.hxx
    odb/polymorphic-object-result.txx
    odb/post.hxx
    odb/pre.hxx
    odb/prepared-query.hxx
    odb/query.hxx
    odb/query-dynamic.hxx
    odb/query-dynamic.ixx
    odb/query-dynamic.txx
    odb/result.hxx
    odb/result.txx
    odb/schema-catalog.hxx
    odb/schema-catalog-impl.hxx
    odb/schema-version.hxx
    odb/section.hxx
    odb/session.hxx
    odb/session.ixx
    odb/session.txx
    odb/simple-object-result.hxx
    odb/simple-object-result.txx
    odb/statement.hxx
    odb/statement-processing-common.hxx
    odb/std-array-traits.hxx
    odb/std-deque-traits.hxx
    odb/std-forward-list-traits.hxx
    odb/std-list-traits.hxx
    odb/std-map-traits.hxx
    odb/std-set-traits.hxx
    odb/std-unordered-map-traits.hxx
    odb/std-unordered-set-traits.hxx
    odb/std-vector-traits.hxx
    odb/tracer.hxx
    odb/traits.hxx
    odb/transaction.hxx
    odb/transaction.ixx
    odb/vector.hxx
    odb/vector.ixx
    odb/vector-impl.hxx
    odb/vector-impl.ixx
    odb/vector-traits.hxx
    odb/vector-traits.txx
    odb/version.hxx
    odb/view-image.hxx
    odb/view-result.hxx
    odb/view-result.txx
    odb/wrapper-traits.hxx

    odb/details/buffer.hxx
    odb/details/c-string.hxx
    odb/details/condition.hxx
    odb/details/config.hxx
    odb/details/exception.hxx
    odb/details/export.hxx
    odb/details/function-wrapper.hxx
    odb/details/function-wrapper.ixx
    odb/details/function-wrapper.txx
    odb/details/lock.hxx
    odb/details/mutex.hxx
    odb/details/shared-ptr-fwd.hxx
    odb/details/shared-ptr.hxx
    odb/details/thread.hxx
    odb/details/tls.hxx
    odb/details/transfer-ptr.hxx
    odb/details/type-info.hxx
    odb/details/unique-ptr.hxx
    odb/details/unused.hxx
    odb/details/wrapper-p.hxx

    odb/details/meta/answer.hxx
    odb/details/meta/class-p.hxx
    odb/details/meta/polymorphic-p.hxx
    odb/details/meta/remove-const-volatile.hxx
    odb/details/meta/remove-const.hxx
    odb/details/meta/remove-pointer.hxx
    odb/details/meta/remove-volatile.hxx
    odb/details/meta/static-assert.hxx

    odb/details/shared-ptr/base.hxx
    odb/details/shared-ptr/base.ixx
    odb/details/shared-ptr/base.txx
    odb/details/shared-ptr/counter-type.hxx
    odb/details/shared-ptr/exception.hxx

    odb/tr1/lazy-pointer-traits.hxx
    odb/tr1/lazy-ptr.hxx
    odb/tr1/lazy-ptr.ixx
    odb/tr1/lazy-ptr.txx
    odb/tr1/memory.hxx
    odb/tr1/pointer-traits.hxx
    odb/tr1/wrapper-traits.hxx
)

if(WIN32)
    set(ODB_INCLUDE
        ${ODB_INCLUDE}
        odb/details/config-vc.h

        odb/details/win32/condition.hxx
        odb/details/win32/condition.ixx
        odb/details/win32/exceptions.hxx
        odb/details/win32/init.hxx
        odb/details/win32/lock.hxx
        odb/details/win32/mutex.hxx
        odb/details/win32/mutex.ixx
        odb/details/win32/once-init.hxx
        odb/details/win32/once.hxx
        odb/details/win32/once.ixx
        odb/details/win32/thread.hxx
        odb/details/win32/tls-init.hxx
        odb/details/win32/tls.hxx
        odb/details/win32/tls.ixx
        odb/details/win32/windows.hxx
    )
else()
    set(ODB_INCLUDE
        ${ODB_INCLUDE}
        odb/details/config.h

        odb/details/posix/condition.hxx
        odb/details/posix/condition.ixx
        odb/details/posix/exceptions.hxx
        odb/details/posix/mutex.hxx
        odb/details/posix/mutex.ixx
        odb/details/posix/thread.hxx
        odb/details/posix/thread.ixx
        odb/details/posix/tls.hxx
        odb/details/posix/tls.ixx
        odb/details/posix/tls.txx
    )
endif()

set(ODB_SRC
    odb/connection.cxx
    odb/database.cxx
    odb/exceptions.cxx
    odb/prepared-query.cxx
    odb/query-dynamic.cxx
    odb/result.cxx
    odb/schema-catalog.cxx
    odb/section.cxx
    odb/session.cxx
    odb/statement-processing.cxx
    odb/statement.cxx
    odb/tracer.cxx
    odb/transaction.cxx
    odb/vector-impl.cxx

    odb/details/buffer.cxx
    odb/details/condition.cxx
    odb/details/lock.cxx
    odb/details/mutex.cxx

    odb/details/shared-ptr/base.cxx
)

if(WIN32)
    set(ODB_SRC
        ${ODB_SRC}
        odb/details/win32/condition.cxx
        odb/details/win32/dll.cxx
        odb/details/win32/exceptions.cxx
        odb/details/win32/init.cxx
        odb/details/win32/once.cxx
        odb/details/win32/thread.cxx
        odb/details/win32/tls.cxx
    )
else()
    set(ODB_SRC
        ${ODB_SRC}
        odb/details/posix/exceptions.cxx
        odb/details/posix/thread.cxx
    )
endif()

if(UNIX)
    add_definitions(
        -DHAVE_CONFIG_H
        -DODB_THREADS_POSIX
    )

    set(THREADS_PREFER_PTHREAD_FLAG ON)
    find_package(Threads REQUIRED)
    set(ODB_LIBRARIES
        Threads::Threads
        dl
    )
endif()

add_library(odb ${ODB_INCLUDE} ${ODB_SRC})
target_link_libraries(odb ${ODB_LIBRARIES})
target_include_directories(odb PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
if(BUILD_SHARED_LIBS)
    target_compile_definitions(odb PUBLIC LIBODB_DYNAMIC_LIB)
else()
    target_compile_definitions(odb PUBLIC LIBODB_STATIC_LIB)
endif()

set_target_properties(odb
    PROPERTIES
    CXX_STANDARD 14
    CXX_EXTENSIONS OFF
    DEBUG_OUTPUT_NAME odb-d
    RELEASE_OUTPUT_NAME odb
)
