#![cfg_attr(not(feature = "std"), no_std)]

#[cfg(feature = "std")]
use std::os::raw::{c_int};

#[cfg(not(feature = "std"))]
use core::ffi::c_int;

#[cfg(not(feature = "std"))] 
use core::panic::PanicInfo;

// Panic handler
#[cfg(not(feature = "std"))]
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn add(a: c_int, b: c_int) -> c_int {
    a + b
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
