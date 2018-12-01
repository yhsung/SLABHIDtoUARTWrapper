%module SLABHIDtoUARTWrapper
%{
#include "SLABHIDtoUART.h"
%}
%include "typemaps.i"

/* Used for functions that output a new opaque pointer */
%typemap(in,numinputs=0) HID_UART_DEVICE *OUTPUT (HID_UART_DEVICE retval)
{
 /* OUTPUT in */
    retval = NULL;
    $1 = &retval;
}

/* used for functions that take in an opaque pointer (or NULL)
and return a (possibly) different pointer */
%typemap(argout) HID_UART_DEVICE *OUTPUT, HID_UART_DEVICE *INOUT
{
 /* OUTPUT argout */
  %append_output(SWIG_NewPointerObj(SWIG_as_voidptr(retval$argnum), $1_descriptor, 0));
}

%typemap(in) HID_UART_DEVICE *INOUT (HID_UART_DEVICE retval)
{
   /* INOUT in */
   SWIG_ConvertPtr(obj1,SWIG_as_voidptrptr(&retval), 0, 0);
    $1 = &retval;
}
%include "SLABHIDtoUART.h"

%include cpointer.i
%include windows.i
%pointer_functions(BOOL, BOOLp);
%pointer_functions(BYTE, BYTEp);
%pointer_functions(WORD, WORDp);
%pointer_functions(DWORD, DWORDp);
%pointer_functions(HID_UART_DEVICE, HID_UART_DEVICEp);
%pointer_functions(char, charp);
