<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Book;

class BookController extends Controller
{
    public function index()
    {
        $books = Book::all();
        return view('books.index', compact('books'));
    }

    public function search(Request $request)
    {
        $bookTitle = $request->input('title');
        $book = Book::where('title', $bookTitle)->first();
        return view('books.search', compact('book'));
    }
}
