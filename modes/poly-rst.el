;;; poly-rst.el
;;
;; Filename: poly-rst.el
;; Author: Spinu Vitalie
;; Maintainer: Spinu Vitalie
;; Copyright (C) 2013-2014, Spinu Vitalie, all rights reserved.
;; Version: 1.0
;; URL: https://github.com/vitoshka/polymode
;; Keywords: emacs
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This file is *NOT* part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'polymode)
(require 'rst)

(defcustom pm-host/rst
  (pm-bchunkmode "ReStructuredText"
				 :mode 'rst-mode)
  "ReStructuredText host chunkmode"
  :group 'hostmodes
  :type 'object)

;; (defcustom  pm-inner/rst
;;   (pm-hbtchunkmode-auto "rst"
;;                      :head-reg "^[ \t]*\\.\\.{[ \t]*\w.*$"
;;                      :tail-reg "^[ \t]*\\.\\.[ \t]*$"
;;                      :retriever-regexp "\\.\\.[ \t]*{?\\(\\(\\w\\|\\s_\\)*\\)"
;;                      :font-lock-narrow t)
;;   "ReStructuredText typical chunk."
;;   :group 'innermodes
;;   :type 'object)

(defcustom pm-inner/rst
  (pm-hbtchunkmode "rst"
                   :mode 'rst-mode
                   :head-reg "^[ \t]*\\.\\.[ \t]*{\w.*$"
                   :tail-reg "^[ \t]*\\.\\.[ \t]*$"
                   :font-lock-narrow t)
  "ReStructuredText typical chunk."
  :group 'innermodes
  :type 'object)

;; (defcustom pm-poly/rst
;;   (pm-polymode-multi-auto "rst"
;;                         :hostmode 'pm-host/rst
;;                         :auto-innermode 'pm-inner/rst
;;                         :init-functions '(poly-rst-remove-rst-hooks))
;;   "ReST typical configuration"
;;   :group 'polymodes
;;   :type 'object)

(defcustom pm-poly/rst
  (pm-polymode-one "rst"
                   :hostmode 'pm-host/rst
                   :innermode 'pm-inner/rst)
  "ReST polymode for R"
  :group 'polymodes
  :type 'object)


;;;###autoload  (autoload 'poly-rst-mode "poly-rst")
(define-polymode poly-rst-mode pm-poly/rst)

;;; FIXES:
(defun poly-rst-remove-rst-hooks ()
  )

(provide 'poly-rst)

