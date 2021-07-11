package utcg

import (
    "os"

    "github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command{
		Use:   "utcg",
		Short: "utcg is a UNIX time stamp converter using Go.",
	}
	nano bool
)

func Execute() {
    if err := rootCmd.Execute(); err != nil {
        os.Exit(1)
    }
}

func init() {
    rootCmd.PersistentFlags().BoolVarP(&nano, "nano", "n", false, "unix time nanoseconds enable flag")
}
