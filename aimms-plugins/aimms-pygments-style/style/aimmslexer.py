# -*- coding: utf-8 -*-
"""
    pygments.styles.aimms
    ~~~~~~~~~~~~~~~~~~~~~

    Style inspired by AIMMS Text editor. Note this is not meant
    to be a complete style. It's merely meant to mimic AIMMS syntax highlighting.

    :copyright: Copyright 2006-2018 by the      S User Support team, see AUTHORS.
    :license:   T, see LICENSE for details.
"""

from pygments.style import Style
from pygments.token import Keyword, Name, Comment, String, Error, \
    Number, Operator, Whitespace


class AimmsLexerStyle(Style):
    """
    Style inspired by AIMMS syntax highlighter. Note this is not meant
    to be a complete style. It's merely meant to mimic AIMMS syntax highlighting.
    """

    default_style = ''

    styles = {
        Whitespace:            '#bbbbbb',
        Comment:               'italic #008000',
        String:                'italic #808080',
        Operator:              'bold #000000',
        Keyword:               '#0000ff',
		Keyword.Declaration:   'bold #000000',
        Keyword.Constant:      '',
		Name.Attribute:		   'bold #585858',
		Name.Builtin:		   '#a22a2a',
        Name.Function:         '#2c2cff',

        Name.Variable:         '#db7093',        
        Name.Parameter:        '#008b8b',
        Name.ElementParameter: '#008b8b',
        Name.DatabaseTable:    '#800080',

        Error:                 'bg:#e3d2d2 #a61717',
    }
