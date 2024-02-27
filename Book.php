<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use PhpParser\Node\Expr\BinaryOp\Mod;

class Book extends Model
{
    use HasFactory;

    protected $fillable = ['title'];
}
