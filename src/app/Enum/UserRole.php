<?php

namespace App\Enum;

enum UserRole: string
{
    case DEFAULT = "default";
    case EDITOR = "editor";
    case ADMINISTRATOR = "administrator";
}
