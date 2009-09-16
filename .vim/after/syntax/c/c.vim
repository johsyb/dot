" Vim syntax file example
" Put it to ~/.vim/after/syntax/ and tailor to your needs.

let glib_deprecated_errors = 1
let gobject_deprecated_errors = 1
let gdk_deprecated_errors = 1
let gdkpixbuf_deprecated_errors = 1
let gtk_deprecated_errors = 1
let gimp_deprecated_errors = 1

if version > 600
    runtime! syntax/c/atk.vim
    runtime! syntax/c/atspi.vim
    runtime! syntax/c/cairo.vim
    runtime! syntax/c/dbusglib.vim
    runtime! syntax/c/gail.vim
    runtime! syntax/c/gconf.vim
    runtime! syntax/c/gdkpixbuf.vim
    runtime! syntax/c/gdk.vim
    runtime! syntax/c/gimp.vim
    runtime! syntax/c/glib.vim
    runtime! syntax/c/gnomedesktop.vim
    runtime! syntax/c/gnomevfs.vim
    runtime! syntax/c/gobject.vim
    runtime! syntax/c/gtkglext.vim
    runtime! syntax/c/gtksourceview.vim
    runtime! syntax/c/gtk.vim
    runtime! syntax/c/libglade.vim
    runtime! syntax/c/libgnomecanvas.vim
    runtime! syntax/c/libgnomeui.vim
    runtime! syntax/c/libgnome.vim
    runtime! syntax/c/libgsf.vim
    runtime! syntax/c/libnotify.vim
    runtime! syntax/c/liboil.vim
    runtime! syntax/c/librsvg.vim
    runtime! syntax/c/libwnck.vim
    runtime! syntax/c/orbit2.vim
    runtime! syntax/c/pango.vim
    runtime! syntax/c/poppler.vim
    runtime! syntax/c/vte.vim
    runtime! syntax/c/xlib.vim
endif

" vim: set ft=vim :
