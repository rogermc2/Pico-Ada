

package Async_Context is

   type Async_Context_Kind is 
      (ASYNC_CONTEXT_Null, ASYNC_CONTEXT_POLL, ASYNC_CONTEXT_THREADSAFE_BACKGROUND,
       ASYNC_CONTEXT_FREERTOS);
    for Async_Context_Kind use (ASYNC_CONTEXT_Null => 0,
                                ASYNC_CONTEXT_POLL => 1,
                                ASYNC_CONTEXT_THREADSAFE_BACKGROUND => 2,
                                ASYNC_CONTEXT_FREERTOS => 3);

end Async_Context;