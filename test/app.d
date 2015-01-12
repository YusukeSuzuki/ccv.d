import std.stdio;
import std.string;
import ccv;

T* ccv_get_dense_matrix_cell_by(T)(ccv_dense_matrix_t* x, ulong row, ulong col, ulong ch)
{
	static assert(false);
	return cast(T*)(ccv.ccv_get_dense_matrix_cell_by(0, x, row, col, ch));
}

T* ccv_get_dense_matrix_cell_by(T : ubyte)(ccv_dense_matrix_t* x, ulong row, ulong col, ulong ch)
{
	return cast(T*)(ccv.ccv_get_dense_matrix_cell_by(CCV_8U, x, row, col, ch));
}

T* ccv_get_dense_matrix_cell_by(T : int)(ccv_dense_matrix_t* x, ulong row, ulong col, ulong ch)
{
	return cast(T*)(ccv.ccv_get_dense_matrix_cell_by(CCV_32S, x, row, col, ch));
}

T* ccv_get_dense_matrix_cell_by(T : float)(ccv_dense_matrix_t* x, ulong row, ulong col, ulong ch)
{
	return cast(T*)(ccv.ccv_get_dense_matrix_cell_by(CCV_32F, x, row, col, ch));
}

T* ccv_get_dense_matrix_cell_by(T : long)(ccv_dense_matrix_t* x, ulong row, ulong col, ulong ch)
{
	return cast(T*)(ccv.ccv_get_dense_matrix_cell_by(CCV_64S, x, row, col, ch));
}

T* ccv_get_dense_matrix_cell_by(T : double)(ccv_dense_matrix_t* x, ulong row, ulong col, ulong ch)
{
	return cast(T*)(ccv.ccv_get_dense_matrix_cell_by(CCV_64F, x, row, col, ch));
}

void main(string[] args)
{
	ccv_enable_default_cache();
	ccv_dense_matrix_t* image = null;
	ccv_read(std.string.toStringz(args[1]), &image, CCV_IO_GRAY | CCV_IO_ANY_FILE);

	write("r = ", image.rows, ", c = ", image.cols);

	for(int r = 0; r < image.rows; ++r)
	{
		for(int c = 0; c < image.cols; ++c)
		{
			writeln("pix = ", *ccv_get_dense_matrix_cell_by!(ubyte)(image, r, c, 0));
		}
	}
}

