<?php

namespace App\Enum;

enum StateType: string
{
    case DRAFT = "draft";
    case VALIDATED = "validated";
    case PUBLISHED = "published";
}
