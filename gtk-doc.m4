dnl -*- mode: autoconf -*-

# serial 1

dnl Usage:
dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
AC_DEFUN([GTK_DOC_CHECK],
[
  if test x$enable_gtk_doc = xyes; then
     AC_MSG_ERROR([gtk-doc requested but only gtk-doc-stub is installed])
  fi

  AC_MSG_CHECKING([whether to build gtk-doc documentation])
  AC_MSG_RESULT([no])

  AM_CONDITIONAL([ENABLE_GTK_DOC], [false])
  AM_CONDITIONAL([GTK_DOC_BUILD_HTML], [false])
  AM_CONDITIONAL([GTK_DOC_BUILD_PDF], [false])
  AM_CONDITIONAL([GTK_DOC_USE_LIBTOOL], [false])
  AM_CONDITIONAL([GTK_DOC_USE_REBASE], [false])
])
