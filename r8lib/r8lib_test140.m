function r8lib_test140 ( )

%*****************************************************************************80
%
%% TEST140 tests R8VEC_SORT_HEAP_INDEX_A and R8VEC_SORT_HEAP_INDEX_D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST140\n' );
  fprintf ( 1, '  R8VEC_SORT_HEAP_INDEX_A creates an ascending\n' );
  fprintf ( 1, '    sort index for an R8VEC.\n' );
  fprintf ( 1, '  R8VEC_SORT_HEAP_INDEX_D creates a descending\n' );
  fprintf ( 1, '    sort index for an R8VEC.\n' );

  b = 0.0;
  c = 3.0 * n;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );
 
  r8vec_print_some ( n, a, 1, 10, '  Unsorted array:' );

  indx = r8vec_sort_heap_index_a ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After indexed ascending sort:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %12f\n', i, indx(i), a(i) );
  end
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now use the index array to carry out the\n' );
  fprintf ( 1, '  permutation implicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  INDX(I), A(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', indx(i), a(indx(i)) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Call R8VEC_PERMUTE to carry out the permutation\n' );
  fprintf ( 1, '  explicitly.\n' );

  a = r8vec_permute ( n, a, indx );

  r8vec_print ( n, a, '  I, A(I)' );

  indx = r8vec_sort_heap_index_d ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After indexed descending sort:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, INDX(I), A(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %6d  %12f\n', i, indx(i), a(i) );
  end
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now use the index array to carry out the\n' );
  fprintf ( 1, '  permutation implicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  INDX(I), ARRAY(INDX(I))\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', indx(i), a(indx(i)) );
  end

  return
end